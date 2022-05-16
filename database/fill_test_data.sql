INSERT INTO gctl_node(host, descr) VALUES
('node1:4242', 'Node South-East'),
('node-north:4242', 'Node North')

INSERT INTO gctl_actor(node, atype, descr) VALUES
('1', 'V', 'Water Section South'),
('1', 'V', 'Water Section East'),
('1', 'P', 'Pump South-East'),
('2', 'V', 'Water North'),
('2', 'L', 'Garden Lights')