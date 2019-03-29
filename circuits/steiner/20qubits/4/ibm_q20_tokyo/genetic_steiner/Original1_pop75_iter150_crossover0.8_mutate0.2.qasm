// Initial wiring: [19, 0, 15, 9, 7, 18, 16, 11, 5, 12, 3, 6, 2, 10, 8, 1, 14, 17, 4, 13]
// Resulting wiring: [19, 0, 15, 9, 7, 18, 16, 11, 5, 12, 3, 6, 2, 10, 8, 1, 14, 17, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[16];
cx q[13], q[16];
cx q[12], q[17];
cx q[9], q[11];
