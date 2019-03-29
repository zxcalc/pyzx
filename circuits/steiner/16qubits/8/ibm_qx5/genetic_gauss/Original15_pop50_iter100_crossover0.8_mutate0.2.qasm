// Initial wiring: [3, 4, 5, 15, 9, 8, 6, 7, 12, 11, 2, 1, 0, 14, 13, 10]
// Resulting wiring: [3, 4, 5, 15, 9, 8, 6, 7, 12, 11, 2, 1, 0, 14, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[7];
cx q[11], q[1];
cx q[14], q[0];
cx q[14], q[1];
cx q[12], q[9];
cx q[10], q[13];
cx q[5], q[15];
cx q[3], q[12];
