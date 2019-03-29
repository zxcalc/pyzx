// Initial wiring: [10, 4, 7, 0, 12, 1, 11, 9, 14, 5, 15, 2, 6, 8, 13, 3]
// Resulting wiring: [10, 4, 7, 0, 12, 1, 11, 9, 14, 5, 15, 2, 6, 8, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[0];
cx q[9], q[8];
cx q[9], q[3];
cx q[11], q[3];
cx q[15], q[4];
cx q[10], q[13];
cx q[8], q[12];
cx q[4], q[8];
