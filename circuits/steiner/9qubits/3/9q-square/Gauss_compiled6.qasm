// Initial wiring: [0 1 2 4 8 5 7 6 3]
// Resulting wiring: [0 1 2 4 8 5 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[2], q[3];
cx q[4], q[7];
