// Initial wiring: [1, 18, 7, 6, 11, 15, 5, 19, 2, 14, 8, 12, 16, 13, 4, 3, 9, 17, 10, 0]
// Resulting wiring: [1, 18, 7, 6, 11, 15, 5, 19, 2, 14, 8, 12, 16, 13, 4, 3, 9, 17, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[2];
cx q[9], q[0];
cx q[14], q[13];
cx q[17], q[16];
cx q[16], q[13];
cx q[15], q[16];
cx q[7], q[13];
