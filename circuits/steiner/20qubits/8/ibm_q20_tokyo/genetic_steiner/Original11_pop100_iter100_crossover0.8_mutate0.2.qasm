// Initial wiring: [9, 12, 7, 4, 11, 19, 18, 16, 15, 17, 14, 6, 2, 0, 1, 3, 10, 13, 5, 8]
// Resulting wiring: [9, 12, 7, 4, 11, 19, 18, 16, 15, 17, 14, 6, 2, 0, 1, 3, 10, 13, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[6], q[3];
cx q[14], q[16];
cx q[16], q[17];
cx q[13], q[14];
cx q[12], q[13];
cx q[6], q[13];
cx q[2], q[7];
