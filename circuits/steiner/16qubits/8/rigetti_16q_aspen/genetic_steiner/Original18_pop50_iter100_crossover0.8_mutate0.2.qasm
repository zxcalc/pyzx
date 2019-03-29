// Initial wiring: [9, 8, 5, 6, 2, 1, 0, 14, 7, 10, 13, 3, 4, 15, 11, 12]
// Resulting wiring: [9, 8, 5, 6, 2, 1, 0, 14, 7, 10, 13, 3, 4, 15, 11, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[13], q[14];
cx q[12], q[13];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[9], q[10];
cx q[6], q[7];
