// Initial wiring: [6, 16, 14, 17, 5, 2, 18, 7, 8, 15, 9, 12, 4, 1, 0, 3, 10, 13, 11, 19]
// Resulting wiring: [6, 16, 14, 17, 5, 2, 18, 7, 8, 15, 9, 12, 4, 1, 0, 3, 10, 13, 11, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[7], q[1];
cx q[13], q[16];
cx q[16], q[17];
cx q[13], q[14];
cx q[6], q[13];
cx q[13], q[14];
cx q[6], q[12];
cx q[14], q[13];
cx q[5], q[14];
