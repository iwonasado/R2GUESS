Postprocess.R2GUESS <- function(x){
  if(x$Finish==TRUE) stop("You don't need to use this function as you run has already finished")
  
  command <- paste(x$command," -postProcess ",sep="")
  print(command)
  if (.Platform$OS.type == "unix") {
    system(command)
  } else if (.Platform$OS.type == "windows") {
    shell(command)
  }
  
  Namefeatures <- file.path(x$path.output, paste(x$root.file.output,"features.txt",sep="_"))
  features <- read.table(file=Namefeatures,header=TRUE)
  rownames(features) <- features[,1]
  
  
  BestModels <- get.best.models(x$path.output,x$path.input,x$root.file.output,label.X=x$label.X,p=x$p,x$MAP.file)
  res <- list(dataY = x$dataY, dataX = x$dataX, path.input = x$path.input, 
              path.output = x$path.output, path.par=x$path.par, path.init=x$path.init, history = x$history, time = x$time, file.par =x$file.par,file.init=x$file.init,file.log=x$file.log,
              root.file.output = x$root.file.output, nsweep = features["last_sweep","value"], 
              top = x$top, BestModels = BestModels, label.X = x$label.X, 
              label.Y = x$label.Y, p = x$p, q = x$q, n=x$n, nb.chain = x$nb.chain,
              burn.in = x$burn.in,conf=x$conf,cuda=x$cuda,Egam=x$Egam,Sgam=x$Sgam,MAP.file=x$MAP.file,command=command,nsweep.extend=x$nsweep.extend,seed=x$seed,Finish=x$Finish)
  class(res) <- "ESS"
  return(res)  
}
