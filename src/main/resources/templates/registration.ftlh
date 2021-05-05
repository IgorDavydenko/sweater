<#import "patterns/common.ftlh" as common>
<#import "patterns/auth.ftlh" as auth>

<@common.htmlTree>
    <h2>Add new user</h2>
    <#if message?has_content>
        ${message}
    </#if>
    <@auth.authForm path="/registration" button="Sign Up"/>
</@common.htmlTree>