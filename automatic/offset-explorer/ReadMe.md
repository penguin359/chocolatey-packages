# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/kafka-tool/kafka-tool.png" width="48" height="48"/> [Kafka Tool](https://chocolatey.org/packages/kafka-tool)

### Kafka Browser
The browser tree in Offset Explorer allows you to view and navigate the objects in your Apache Kafka® cluster -- brokers, topics, partitions, consumers -- with a couple of mouse-clicks. Connections to your Kafka cluster are persisted so you don't need to memorize or enter them every time. You can quickly view information about all your clusters no matter how many you have.


### View Messages
You can quickly view messages and their keys in the partitions of your topics. You can select how many messages to view at once and which offset to read messages from. You can view the oldest or newest messages, or you can specify a starting offset where to start reading the messages from. By default Offset Explorer  will show your messages and keys in hexadecimal format. However, if your messages are UTF-8 encoded strings, Kafka Tool can show the actual string instead of the regular hexadecimal format.

 
### View Text Data as JSON/XML
If your string-based data is either in JSON or XML format, you can view it in a pretty-printed form in the detail panel of the Data-tab under partitions.

 
### View Consumer Offsets
The browser tree allows you to quickly view all the offsets of your Kafka consumers. The list will show both the start/end offsets of the partitions as well as the offset of consumers within each partition.

 
You can also view the offsets stored by the Apache Storm's Kafka spouts. Read more

### Saving Individual Messages
You can save individual messages to a file on your hard drive using the Save-button in the detail panel of the Data-tab of partitions. The file will contain the bytes of the message as-is. You can also save the key of the message using the same mechanism.

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/offset-explorer/screenshot.png)