// Initial wiring: [12, 10, 15, 0, 11, 9, 8, 14, 2, 5, 1, 3, 13, 4, 6, 7]
// Resulting wiring: [12, 10, 15, 0, 11, 9, 8, 14, 2, 5, 1, 3, 13, 4, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[8], q[7];
cx q[12], q[11];
cx q[12], q[13];
cx q[10], q[13];
cx q[8], q[15];
cx q[3], q[4];
cx q[2], q[3];
