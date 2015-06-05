<cfcomponent extends="testbox.system.BaseSpec" output="false">

	<cffunction name="testTimer" returntype="void" access="public" output="false">
		<cfset var timer = createObject("component", "model.util.Timer").init()/>
		<cfset var i = 0/>
		<cfset var collector = ""/>
		<cfset var words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]/>

		<!--- Total execution --->
		<cfset timer.begin("the whole enchilada")/>

		<!--- Run it 10 times --->
		<cfset timer.begin("ten word string")/>
		<cfloop from="1" to="10" index="i">
			<cfset collector = collector & words[randRange(1, 10)]/>
		</cfloop>
		<cfset timer.end("ten word string")/>

		<!--- Run it 100 times --->
		<cfset timer.begin("one hundred word string")/>
		<cfloop from="1" to="100" index="i">
			<cfset collector = collector & words[randRange(1, 10)]/>
		</cfloop>
		<cfset timer.end("one hundred word string")/>

		<!--- Run it 1000 times --->
		<cfset timer.begin("one thousand word string")/>
		<cfloop from="1" to="1000" index="i">
			<cfset collector = collector & words[randRange(1, 10)]/>
		</cfloop>
		<cfset timer.end("one thousand word string")/>

		<!--- Run it 10000 times --->
		<cfset timer.begin("ten thousand word string")/>
		<cfloop from="1" to="10000" index="i">
			<cfset collector = collector & words[randRange(1, 10)]/>
		</cfloop>
		<cfset timer.end("ten thousand word string")/>

		<!--- Run it 100000 times --->
		<cfset timer.begin("one hundred thousand word string")/>
		<cfloop from="1" to="100000" index="i">
			<cfset collector = collector & words[randRange(1, 10)]/>
		</cfloop>
		<cfset timer.end("one hundred thousand word string")/>

		<cfset timer.end("the whole enchilada")/>

		<cfset debug(timer.stats())/>
	</cffunction>

</cfcomponent>