// Initial wiring: [9, 4, 2, 0, 5, 3, 7, 15, 8, 1, 12, 6, 14, 13, 10, 11]
// Resulting wiring: [9, 4, 2, 0, 5, 3, 7, 15, 8, 1, 12, 6, 14, 13, 10, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[9];
cx q[11], q[12];
cx q[12], q[11];
cx q[9], q[14];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[9];
cx q[5], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[4], q[11];
cx q[11], q[12];
cx q[2], q[3];
