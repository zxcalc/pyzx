// Initial wiring: [11, 15, 16, 10, 0, 5, 1, 6, 7, 17, 3, 14, 12, 4, 13, 2, 9, 18, 19, 8]
// Resulting wiring: [11, 15, 16, 10, 0, 5, 1, 6, 7, 17, 3, 14, 12, 4, 13, 2, 9, 18, 19, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[12], q[2];
cx q[14], q[8];
cx q[16], q[18];
cx q[6], q[7];
cx q[6], q[13];
cx q[1], q[13];
cx q[0], q[6];
