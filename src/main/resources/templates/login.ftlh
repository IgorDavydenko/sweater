<#import "patterns/common.ftlh" as common>
<#import "patterns/auth.ftlh" as auth>

<@common.htmlTree>
    <@auth.authForm path="/login" isRegisterForm=false/>
</@common.htmlTree>