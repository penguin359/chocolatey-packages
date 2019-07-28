# [Cronical](https://chocolatey.org/packages/cronical)

.NET-based cron daemon. Can replace Windows Services and Scheduled Tasks, typically for running service-like processes as part of an application suite - or just by itself.

## Introduction
Unix systems (Linux) have since long had excellent support for background tasks, scheduled tasks and worker processes. crond has since long been a staple in the Unix world for scheduling tasks, allowing scripts and programs to be executed using a very simple definition. It's quiet, effective, and very reliable.

Windows have similar features. Scheduled Tasks allows you to schedule jobs, and Windows Services allows you to create programs that run regardless of user logins. However, programs need to be written especially for the Services model; they are not usually easily run from the command line; and they can be tricky to debug. Similarly, Scheduled Tasks is relatively complex, and I have personally found that jobs sometimes stop running, or don't run at all - with little or no warning.

Thus, Cronical was born - an attempt to create an efficient, flexible, and realiable cron service for Windows; without relying on external libraries or complex deployment or configuration, create a way to schedule activities, and run services, in a very lightweight and yet reliable manner.