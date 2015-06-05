<cfcomponent output="false">

	<cffunction name="init" returntype="Timer" access="public" output="false">
		<cfset variables.names = arrayNew(1)/>
		<cfset variables.timers = structNew()/>

		<cfreturn this/>
	</cffunction>

	<cffunction name="new" returntype="void" access="public" output="false">
		<cfargument name="name" type="string" required="true"/>

		<cfset arrayAppend(variables.names, arguments.name)/>
		<cfset variables.timers[arguments.name] = arrayNew(1)/>
		<cfset variables.timers[arguments.name][1] = 0/>
		<cfset variables.timers[arguments.name][2] = 0/>
	</cffunction>

	<cffunction name="begin" returntype="void" access="public" output="false">
		<cfargument name="name" type="string" required="true"/>

		<cfif not structKeyExists(variables.timers, arguments.name)>
			<cfset new(arguments.name)/>
		</cfif>
		<cfset variables.timers[arguments.name][1] = getTickCount()/>
	</cffunction>

	<cffunction name="end" returntype="void" access="public" output="false">
		<cfargument name="name" type="string" required="true"/>

		<cfset variables.timers[arguments.name][2] = getTickCount() - variables.timers[arguments.name][1]/>
		<cfset variables.timers[arguments.name][1] = getTickCount()>
	</cffunction>

	<cffunction name="stats" returntype="array" access="public" output="false">
		<cfargument name="name" type="string" required="false"/>

		<cfset var stats = arrayNew(1)/>
		<cfset var name = "null"/>

		<cfloop array="#variables.names#" index="name">
			<cfset arrayAppend(stats, {"name": name, "time": variables.timers[name][2]})/>
		</cfloop>
		<cfreturn stats/>
	</cffunction>

</cfcomponent>