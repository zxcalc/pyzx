// Initial wiring: [9, 10, 4, 11, 6, 8, 19, 2, 14, 1, 18, 15, 5, 12, 17, 16, 3, 13, 0, 7]
// Resulting wiring: [9, 10, 4, 11, 6, 8, 19, 2, 14, 1, 18, 15, 5, 12, 17, 16, 3, 13, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[8], q[2];
cx q[16], q[17];
cx q[12], q[13];
cx q[8], q[11];
cx q[11], q[12];
cx q[5], q[14];
