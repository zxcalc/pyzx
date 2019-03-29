// Initial wiring: [7, 10, 15, 1, 3, 13, 5, 4, 9, 2, 8, 0, 11, 14, 6, 12]
// Resulting wiring: [7, 10, 15, 1, 3, 13, 5, 4, 9, 2, 8, 0, 11, 14, 6, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[6];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[6];
cx q[12], q[11];
cx q[8], q[9];
cx q[2], q[3];
