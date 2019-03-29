// Initial wiring: [16, 18, 13, 11, 8, 3, 1, 4, 12, 5, 19, 0, 17, 10, 7, 14, 9, 2, 6, 15]
// Resulting wiring: [16, 18, 13, 11, 8, 3, 1, 4, 12, 5, 19, 0, 17, 10, 7, 14, 9, 2, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[12], q[6];
cx q[14], q[15];
cx q[12], q[17];
cx q[11], q[18];
cx q[4], q[5];
cx q[0], q[1];
cx q[1], q[0];
