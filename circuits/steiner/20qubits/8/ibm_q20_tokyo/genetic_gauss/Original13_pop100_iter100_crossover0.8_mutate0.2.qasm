// Initial wiring: [16, 4, 0, 12, 17, 2, 15, 3, 7, 19, 8, 18, 6, 14, 13, 5, 11, 1, 9, 10]
// Resulting wiring: [16, 4, 0, 12, 17, 2, 15, 3, 7, 19, 8, 18, 6, 14, 13, 5, 11, 1, 9, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[4];
cx q[13], q[1];
cx q[15], q[3];
cx q[13], q[6];
cx q[9], q[16];
cx q[6], q[15];
cx q[7], q[14];
