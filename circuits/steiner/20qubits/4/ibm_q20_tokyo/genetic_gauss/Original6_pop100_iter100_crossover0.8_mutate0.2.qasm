// Initial wiring: [17, 11, 10, 16, 13, 18, 14, 5, 19, 8, 15, 3, 1, 12, 4, 6, 0, 9, 7, 2]
// Resulting wiring: [17, 11, 10, 16, 13, 18, 14, 5, 19, 8, 15, 3, 1, 12, 4, 6, 0, 9, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[1];
cx q[15], q[6];
cx q[15], q[7];
cx q[5], q[18];
