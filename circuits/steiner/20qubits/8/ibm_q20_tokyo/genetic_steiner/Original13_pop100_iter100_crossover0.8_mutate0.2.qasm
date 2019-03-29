// Initial wiring: [4, 14, 15, 5, 12, 1, 19, 11, 18, 9, 6, 16, 10, 2, 3, 13, 7, 0, 17, 8]
// Resulting wiring: [4, 14, 15, 5, 12, 1, 19, 11, 18, 9, 6, 16, 10, 2, 3, 13, 7, 0, 17, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[19], q[18];
cx q[14], q[15];
cx q[6], q[7];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[3];
