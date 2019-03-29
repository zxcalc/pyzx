// Initial wiring: [0, 17, 8, 9, 15, 6, 13, 1, 11, 4, 5, 16, 12, 10, 18, 3, 2, 14, 7, 19]
// Resulting wiring: [0, 17, 8, 9, 15, 6, 13, 1, 11, 4, 5, 16, 12, 10, 18, 3, 2, 14, 7, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[12], q[17];
cx q[11], q[17];
cx q[6], q[13];
