<#import "patterns/common.ftlh" as common>

<@common.htmlTree>
    <div class="mb-3">
        <form class="w-50" method="post" action="/index" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="form-control col-6" type="text" name="message" placeholder="input message" />
            <input class="form-control col-6" type="text" name="tag" placeholder="input tag" />
            <div class="col-6">
<#--                <label for="formFileMultiple" class="form-label">Add files</label>-->
                <input class="form-control" type="file" name="file" id="formFileMultiple" multiple>
            </div>
            <div class="col-6">
                <button type="submit" class="btn btn-primary">Add message</button>
            </div>
        </form>
    </div>
    <div class="mb-5">
        <form class="row row-cols-lg-auto g-0 align-items-center" method="get" action="/index">
            <div class="col-6">
                <input class="form-control col-12" type="text" name="filter" value="${filter!""}" placeholder="filter by tag" />
            </div>
            <div class="col-3">
                <button type="submit" class="btn btn-primary">Filter</button>
            </div>
        </form>
    </div>


    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages>
            <#items as message>
                <div class="col">
                    <div class="card border-info" style="width: 18rem;">
                        <div class="card-header">${message.authorName}</div>
                        <#if message.fileName??>
                            <img class="card-img-top" src="/img/${message.fileName}" alt="img">
                        </#if>
                        <div class="card-body">
                            <p class="card-text">${message.text}</p>
                        </div>
                        <div class="card-footer">${message.tag}</div>
                    </div>
                </div>
            </#items>
        <#else>
            No messages
        </#list>
    </div>

<#--    <div>-->
<#--        <div>-->
<#--            <h2>Messages:</h2>-->
<#--            <#list messages>-->
<#--                <table>-->
<#--                    <#items as message>-->
<#--                        <tr>-->
<#--                            <td>${message.text}</td>-->
<#--                            <td>${message.tag}</td>-->
<#--                            <td>${message.authorName}</td>-->
<#--                            <td>-->
<#--                                <#if message.fileName??>-->
<#--                                    <img src="/img/${message.fileName}">-->
<#--                                </#if>-->
<#--                            </td>-->
<#--                        </tr>-->
<#--                    </#items>-->
<#--                </table>-->
<#--            <#else>-->
<#--                No messages-->
<#--            </#list>-->
<#--        </div>-->
<#--    </div>-->
</@common.htmlTree>