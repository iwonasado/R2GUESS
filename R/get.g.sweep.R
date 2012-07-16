get.g.sweep <- function(x,res,model){
  model <- as.character(model)
  path.output <- x$path.output
  file.in <- x$root.file.output
  nsweep <- x$nsweep
  g.history <- paste(path.output,file.in,"_output_g_history.txt",sep="")
  SNPs <- unlist(strsplit(x$BestModels$modelName[as.numeric(model)]," "))
  g <- read.table(g.history,header=TRUE)
  ##remove the burn.in
  g <- g[-(1:x$burn.in),]
  indice <- which(res[,model]==TRUE)
  if(length(indice)==0) stop("the model has not been visited")
  g.value <- g[indice,2] 
  dataX <- read.table(paste(x$path.input,x$dataX,sep=""),skip=2)
  dataY <- read.table(paste(x$path.input,x$dataY,sep=""),skip=2)
  centerY <- scale(dataY,scale=FALSE)
  if(is.null(x$MAP.file)){
    X <- dataX[,as.numeric(SNPs)]
  }else{
    colnames(dataX) <- x$MAP.file$SNPName ###warning file could be an huge file !!!
    X <- dataX[,SNPs]
  }
  centerX <- scale(X,scale=FALSE)	
  res <- list(g.value=g.value,predictors=SNPs,X=centerX,Y=centerY)
  class(res) <- "g.prior"
  return(res)
}
