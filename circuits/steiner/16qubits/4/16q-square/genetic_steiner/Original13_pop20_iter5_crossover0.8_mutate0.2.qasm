// Initial wiring: [3, 2, 6, 10, 7, 0, 15, 9, 5, 8, 13, 14, 12, 4, 1, 11]
// Resulting wiring: [3, 2, 6, 10, 7, 0, 15, 9, 5, 8, 13, 14, 12, 4, 1, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[11], q[12];
cx q[10], q[13];
