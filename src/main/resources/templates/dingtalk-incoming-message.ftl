<#if executionData.job.group??>
    <#assign jobName="${executionData.job.group} / ${executionData.job.name}">
<#else>
    <#assign jobName="${executionData.job.name}">
</#if>
<#assign message="<${executionData.href}|Execution #${executionData.id}> of job <${executionData.job.href}|${jobName}>">
<#if trigger == "start">
    <#assign state="start">
<#elseif trigger == "failure">
    <#assign state="error">
<#else>
    <#assign state="success">
</#if>
<#assign optionStr = "">
<#list executionData.context.option?keys as key>
    <#assign optionStr = optionStr + "\\n* " + key + " = " + executionData.context.option[key]>
</#list>
{
    "msgtype": "markdown",
    "markdown": {
        "title":"## ${jobName}: ${state}",
        "text": "## ${jobName}: ${state} \n\n Username: ${executionData.user} \n\n Project:  ${executionData.project} \n\n Job: [${jobName}](${executionData.job.href}) \n\n Execution id: [${executionData.id}](${executionData.href}) \n\n Execution parameters: ${optionStr} "
     }
}

