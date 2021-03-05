### --- anything java related --- ###

### --- kotlin related

#-- compile a `kotlin.kt` file to `kotlin.kt.jar`, because it is easier
kotlinCompile () {
  kotlinc $1 -include-runtime -d $1.jar
}

#-- compile and run `kotlin.kt` file to `kotlin.kt.jar`
kotlinRun () {
  kotlinCompile $1 && echo "" && echo "|----- compile done -----|" && echo "" && java -jar $1.jar
}
