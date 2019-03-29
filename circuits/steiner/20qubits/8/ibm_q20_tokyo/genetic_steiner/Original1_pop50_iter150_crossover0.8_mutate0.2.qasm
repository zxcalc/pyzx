// Initial wiring: [7, 17, 0, 14, 6, 12, 9, 2, 10, 18, 11, 19, 8, 4, 16, 13, 3, 1, 5, 15]
// Resulting wiring: [7, 17, 0, 14, 6, 12, 9, 2, 10, 18, 11, 19, 8, 4, 16, 13, 3, 1, 5, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[5], q[3];
cx q[12], q[6];
cx q[15], q[13];
cx q[16], q[13];
cx q[12], q[18];
cx q[7], q[13];
cx q[5], q[6];
