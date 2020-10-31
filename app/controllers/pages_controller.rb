class PagesController < ApplicationController
  def home
    @questions = Question.all
  end

  def solve
    @questions = Question.all
    @questions.reject{|question| question.resolved || question.escalated}
  end

  def dashboard
    @users = User.all
    @questions = Question.all
    @tareport = Array.new()
    j=0
    rd = 0
    ed= 0
    avg = 0
    while(j < @questions.length)
      if @questions[j].resolved
        rd = rd + 1
        st = @questions[j].start_time
        et = @questions[j].end_time
        st = st.split(' ')[1]
        et = et.split(' ')[1]
        starr = st.split(':')
        etarr = et.split(':')
        sthr = starr[0].to_i
        ethr = etarr[0].to_i
        stmin = starr[1].to_i
        etmin = etarr[1].to_i
        overall = ((ethr-sthr) * 60) + (etmin - stmin)
        avg = avg + overall
      end
      if @questions[j].escalated
        ed = ed + 1
      end
      j = j + 1
    end
    if avg != 0 && rd != 0
      avg = avg / rd
    end

    @allreport = Hash["total_doubts" => @questions.length, "resolved_doubt" => rd, "escalated_doubt" => ed, "Average" => avg]
    i = 0 
    while(i < @users.length)
      if @users[i].ta
        e=0
        r=0
        t=0
        ri=0
        while(ri < @questions.length)
          if @users[i].email.split('@')[0] == @questions[ri].username
            if @questions[ri].resolved
              r = r + 1
              st = @questions[ri].start_time
              et = @questions[ri].end_time
              st = st.split(' ')[1]
              et = et.split(' ')[1]
              starr = st.split(':')
              etarr = et.split(':')
              sthr = starr[0].to_i
              ethr = etarr[0].to_i
              stmin = starr[1].to_i
              etmin = etarr[1].to_i
              overall = ((ethr - sthr) * 60) + (etmin - stmin)
              t = t + overall
            end
            if @questions[ri].escalated
              e = e + 1
            end
          end
          ri = ri + 1
        end
        if r != 0 || t != 0
          t = t/r
        end
        obj = Hash["username" => @users[i].email.split('@')[0], "resolved" => r, "escalated" => e, "total" => r+e, "time" => t]
        @tareport.push(obj)
      end
      i = i + 1
    end
  end
  
end
