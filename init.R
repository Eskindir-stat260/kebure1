
# init.R

my_packages = c("randomforest","data.table")

install_if_missing= function(p){
  if(p %in%rownames(install.packages())==FALSE){
    install.packages(p)
  }
}
invisible(sapply(my_packages,install_if_missing))