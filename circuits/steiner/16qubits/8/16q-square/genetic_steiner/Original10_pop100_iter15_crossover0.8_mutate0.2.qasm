// Initial wiring: [10, 8, 1, 15, 6, 0, 3, 14, 4, 11, 7, 5, 9, 2, 12, 13]
// Resulting wiring: [10, 8, 1, 15, 6, 0, 3, 14, 4, 11, 7, 5, 9, 2, 12, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[9], q[8];
cx q[10], q[5];
cx q[11], q[4];
cx q[4], q[3];
cx q[14], q[13];
cx q[7], q[8];
