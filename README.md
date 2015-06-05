# Timer

Timer is a simple timing utility for CFML applications to assess code execution speed.

## Features

- Keeps track of multiple timing counters
- The order of the timing counters is preserved for logical display in statistics
- Supports arbitrary nesting of timing counters

## Usage

The following is a simple Timer example. You can also see `/test/unit/util/TimerTest.cfc` for a runnable example.

Create an instance of Timer.
```
<cfset var timer = createObject("component", "model.util.Timer").init()/>
```
Create a named timing counter. A batch of timing counters can be created before starting any of them; this sets the order of timing counters before collecting data. This step can be skipped if you'd like to create the timing counter and start it in one call.
```
<cfset timer.new("transmogrifier total time")/>
```
Begin the named timing counter before executing the code to be timed. If the timing counter doesn't already exist, it will be created.
```
<cfset timer.begin("transmogrifier total time")/>
<cfset transmogrifier.execute("Susie", "bowl of chowder")/>
```
Upon completion of the code being timed, end the named timing counter.
```
<cfset timer.end("transmogrifier total time")/>
```
Collect the statistics of all named timing counters.
```
<cfset debug(timer.stats())/>
```
The result will be an array of structures, each of which have the name of the counter and the number of milliseconds counted. For example:
```json
[
  {
    "name": "transmogrifier total time",
    "time": 39922
  }
]
```

## Future Enhancements

I'd like to add a nice mechanism for pause/resume so that some execution could be excluded using an intuitive API.