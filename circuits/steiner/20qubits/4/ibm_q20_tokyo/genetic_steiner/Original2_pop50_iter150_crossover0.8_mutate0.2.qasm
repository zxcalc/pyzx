// Initial wiring: [1, 3, 6, 14, 4, 8, 18, 12, 17, 0, 7, 15, 16, 5, 11, 2, 13, 10, 19, 9]
// Resulting wiring: [1, 3, 6, 14, 4, 8, 18, 12, 17, 0, 7, 15, 16, 5, 11, 2, 13, 10, 19, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[6], q[3];
cx q[14], q[13];
cx q[17], q[11];
