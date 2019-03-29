// Initial wiring: [5, 3, 9, 14, 6, 10, 1, 15, 11, 13, 8, 12, 4, 2, 0, 7]
// Resulting wiring: [5, 3, 9, 14, 6, 10, 1, 15, 11, 13, 8, 12, 4, 2, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[7], q[6];
cx q[6], q[1];
cx q[10], q[5];
cx q[11], q[4];
cx q[4], q[3];
cx q[10], q[13];
