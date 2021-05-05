<#import "patterns/common.ftlh" as common>
<#import "patterns/auth.ftlh" as auth>

<@common.htmlTree>
    <@auth.authForm path="/login" button="Sign In"/>
    <a href="/registration">add new user</a>
</@common.htmlTree>