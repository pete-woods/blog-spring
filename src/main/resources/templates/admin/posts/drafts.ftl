<#-- @ftlvariable name="posts" type="java.util.List<com.bianjp.blog.entity.Post>" -->
<#-- @ftlvariable name="totalPages" type="java.lang.Integer" -->
<#-- @ftlvariable name="currentPage" type="java.lang.Integer" -->
<#-- @ftlvariable name="pageLink" type="java.lang.String" -->
<#import "../layout/layout.ftl" as layout>
<#import "../helper/pagination.ftl" as helper>
<@layout.layout pageTitle="Posts">
<h2>Posts</h2>

<table class="ui table">
  <thead>
  <tr>
    <th>Title</th>
    <th>Created At</th>
    <th>Last Updated At</th>
    <th>Operations</th>
  </tr>
  </thead>

  <tbody data-delete-api="/admin/posts/{id}">
    <#list posts as post>
    <tr data-id="${post.id}">
      <td><a href="/admin/posts/${post.id}/edit">${post.title}</a></td>
      <td>${post.createdAt.toString("yyyy/MM/dd HH:mm")}</td>
      <td>${post.updatedAt.toString("yyyy/MM/dd HH:mm")}</td>
      <td class="operations">
        <a href="#" class="delete">Delete</a>
      </td>
    </tr>
    </#list>
  </tbody>

  <tfoot>
  <tr>
    <th class="pagination-container" colspan="4">
      <@helper.pagination currentPage=currentPage totalPages=totalPages pageLink=pageLink></@helper.pagination>
    </th>
  </tr>
  </tfoot>
</table>
  <#include "_delete_confirmation_modal.ftl">
</@layout.layout>