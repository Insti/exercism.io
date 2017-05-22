module ExercismWeb
  module Routes
    class Contribute < Core
      get '/contribute' do
        erb :"contribute/index"
      end

      get '/contribute/canonical-data/?:slug?' do |slug|
        slug ||= ''

        active_problems = Trackler.problems.reject(&:deprecated?).sort_by(&:name)
        need_canonical  = active_problems.reject(&:canonical_data_url)

        problem = Trackler.problems[slug]

        if problem.exists?
          erb :"contribute/canonical_data_for_problem", locals: {
            problems: need_canonical,
            current_problem: problem,
            implementations: Trackler.implementations[slug],
          }
        else
          erb :"contribute/canonical_data", locals: {
            problems: need_canonical,
            active_problems_count: active_problems.size,
            canonical_problems_count: [active_problems - need_canonical].size
          }
        end
      end
    end
  end
end
