use graylog2;

db.createCollection("inputs");

key = { title: 'exposed-gelf-udp' };
data = {
    "title" : "exposed-gelf-udp",
    "global" : true,
    "input_id" : "02d622dc-90f7-449b-b883-4467ecd56577",
    "created_at" : ISODate("2014-10-31T13:27:31.395Z"),
    "configuration" : {
        "port" : 12201,
        "bind_address" : "0.0.0.0",
        "recv_buffer_size" : 1048576
    },
    "creator_user_id" : "admin",
    "type" : "org.graylog2.inputs.gelf.udp.GELFUDPInput"
};


db.inputs.update(key, data, { upsert: true });

