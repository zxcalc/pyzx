// Initial wiring: [7, 8, 6, 0, 5, 15, 14, 12, 3, 1, 10, 9, 13, 4, 11, 2]
// Resulting wiring: [7, 8, 6, 0, 5, 15, 14, 12, 3, 1, 10, 9, 13, 4, 11, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[15], q[8];
cx q[12], q[13];
cx q[6], q[7];
