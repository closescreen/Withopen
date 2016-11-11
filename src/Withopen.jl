module Withopen

export withopen

"""
withopen(`zcat a.gz`, `viatmp -gz c.gz` ) do rio,wio
               rio|>eachline|> ll->foreach(ll) do l
                  chomp(l)|>_->"=\$_=\n"|> _->print(wio, _)
               end

end
"""
function withopen(func::Function, readcmd::Cmd, writecmd::Cmd)
    open(readcmd) do rio
        open(writecmd,"w") do wio
             func(rio,wio)
        end
    end
end
  

end # module
