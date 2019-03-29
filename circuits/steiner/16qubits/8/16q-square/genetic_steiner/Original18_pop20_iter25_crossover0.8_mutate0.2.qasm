// Initial wiring: [7, 11, 15, 4, 13, 12, 6, 2, 1, 14, 0, 3, 10, 5, 9, 8]
// Resulting wiring: [7, 11, 15, 4, 13, 12, 6, 2, 1, 14, 0, 3, 10, 5, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[12], q[11];
cx q[11], q[4];
cx q[4], q[11];
