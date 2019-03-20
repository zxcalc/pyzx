// Initial wiring: [0 1 2 8 4 5 6 7 3]
// Resulting wiring: [0 1 2 8 4 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[2], q[1];
cx q[8], q[7];
