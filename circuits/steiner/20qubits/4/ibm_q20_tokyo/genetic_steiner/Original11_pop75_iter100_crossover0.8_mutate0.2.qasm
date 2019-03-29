// Initial wiring: [7, 14, 16, 18, 10, 9, 13, 5, 4, 12, 11, 1, 8, 2, 6, 19, 15, 3, 0, 17]
// Resulting wiring: [7, 14, 16, 18, 10, 9, 13, 5, 4, 12, 11, 1, 8, 2, 6, 19, 15, 3, 0, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[17];
cx q[10], q[19];
cx q[6], q[13];
cx q[2], q[7];
