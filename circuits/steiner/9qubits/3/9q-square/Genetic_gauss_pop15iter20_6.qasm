// Initial wiring: [5 2 1 3 7 0 6 4 8]
// Resulting wiring: [5 2 1 3 7 0 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[1], q[0];
cx q[8], q[3];
