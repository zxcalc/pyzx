// Initial wiring: [6, 12, 15, 0, 11, 5, 9, 14, 2, 7, 1, 10, 8, 4, 13, 3]
// Resulting wiring: [6, 12, 15, 0, 11, 5, 9, 14, 2, 7, 1, 10, 8, 4, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[12], q[11];
cx q[14], q[13];
cx q[14], q[15];
cx q[10], q[13];
cx q[8], q[9];
cx q[3], q[4];
cx q[2], q[3];
