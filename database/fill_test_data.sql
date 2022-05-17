INSERT INTO gctl_node(host, descr) VALUES
('node1:4242', 'Node South-East'),
('node-north:4242', 'Node North'),
('sense-node:4242', 'Sensors');

INSERT INTO gctl_actor(node, atype, descr) VALUES
(1, 'V', 'Water Section South'),
(1, 'V', 'Water Section East'),
(1, 'P', 'Pump South-East'),
(2, 'V', 'Water North'),
(2, 'L', 'Garden Lights');

INSERT INTO gctl_sensor (node, stype, descr) VALUES
(1, 'F', 'Water flow South-East'),
(3, 'R', 'Local Rain Status'),
(3, 'L', 'How bright it is'),
(3, 'H', 'Average Air Humidity');