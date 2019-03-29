// Initial wiring: [7, 2, 10, 14, 6, 12, 3, 8, 15, 9, 1, 0, 4, 11, 5, 13]
// Resulting wiring: [7, 2, 10, 14, 6, 12, 3, 8, 15, 9, 1, 0, 4, 11, 5, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[9];
cx q[7], q[4];
cx q[9], q[5];
cx q[15], q[12];
cx q[13], q[7];
cx q[4], q[15];
cx q[4], q[13];
cx q[4], q[9];
