### --- anything java related --- ###

### --- Maven and compiling

alias maven='mvn'
alias mvnc='mvn compile -q'
alias mvnp='mvn package -q'
mvnCC() { 
  if test -z "$1"; then echo "need a message for git commit" ; return; fi
  mvn compile -q && mvn package -q && ctags -R && gitCC "$1" 
}

### --- kotlin related

#-- compile a `kotlin.kt` file to `kotlin.kt.jar`, because it is easier
kotlinCompile () {
  kotlinc $1 -include-runtime -d $1.jar
}

#-- compile and run `kotlin.kt` file to `kotlin.kt.jar`
kotlinRun () {
  kotlinCompile $1 && echo "" && echo "|----- compile done -----|" && echo "" && java -jar $1.jar
}
