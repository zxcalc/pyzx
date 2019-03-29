// Initial wiring: [13, 6, 7, 14, 15, 2, 1, 4, 3, 5, 9, 0, 10, 8, 11, 12]
// Resulting wiring: [13, 6, 7, 14, 15, 2, 1, 4, 3, 5, 9, 0, 10, 8, 11, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[1], q[0];
cx q[10], q[9];
cx q[12], q[11];
cx q[14], q[13];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[7];
