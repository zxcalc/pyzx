// Initial wiring: [17, 5, 10, 13, 15, 19, 12, 7, 3, 16, 9, 1, 11, 2, 18, 4, 0, 14, 6, 8]
// Resulting wiring: [17, 5, 10, 13, 15, 19, 12, 7, 3, 16, 9, 1, 11, 2, 18, 4, 0, 14, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[19], q[18];
cx q[6], q[12];
cx q[1], q[8];
