// Initial wiring: [0 3 2 5 7 4 6 1 8]
// Resulting wiring: [0 3 2 5 7 4 6 1 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[8], q[3];
